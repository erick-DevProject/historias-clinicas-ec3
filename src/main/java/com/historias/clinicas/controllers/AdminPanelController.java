/* ---------------------------------------------------------------------------
 *  src/main/java/com/historias/clinicas/controllers/AdminPanelController.java
 * --------------------------------------------------------------------------- */
package com.historias.clinicas.controllers;

import com.historias.clinicas.entity.UserEntity;
import com.historias.clinicas.entity.enums.*;
import com.historias.clinicas.repositories.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

/**
 * Control panel for ADMIN users, managing professionals, administrators, and profile.
 */
@Controller
@RequestMapping("/admin")
public class AdminPanelController {

    private final UserRepository        userRepo;
    private final ProfessionalRepository profRepo;
    private final AdminRepository        adminRepo;

    public AdminPanelController(UserRepository  userRepo,
                                ProfessionalRepository profRepo,
                                AdminRepository adminRepo) {
        this.userRepo  = userRepo;
        this.profRepo  = profRepo;
        this.adminRepo = adminRepo;
    }

    /* ---------------------------------------------------------------
     * DATOS DE LAYOUT (rol para el sidebar)
     * --------------------------------------------------------------- */
    @ModelAttribute
    public void populateRole(Model model, HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("USER");
        Role role       = (Role)       session.getAttribute("ROLE");

        boolean isPrimary = user != null
                && adminRepo.existsByUserIdAndPrimaryAdminTrue(user.getUserId());

        String roleStr = (role == Role.ADMIN && isPrimary)
                ? "ADMIN_PRIMARY"
                : (role != null ? role.name() : "");

        model.addAttribute("role", roleStr);
    }

    /* ===============================================================
     * ===  PROFESIONALES  (cualquier admin)                       ===
     * =============================================================== */

    @GetMapping("/professionals")
    public String listProfessionals(Model m) {
        m.addAttribute("pros", profRepo.findAll());
        return "admin/professionals";
    }

    @GetMapping("/professionals/new")
    public String newProfessionalForm(Model m) {
        m.addAttribute("profTypes",  ProfType.values());
        m.addAttribute("sexValues",  Sex.values());
        return "admin/professional-form";
    }

    @PostMapping("/professionals")
    public String createProfessional(
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String firstName,
            @RequestParam String lastName,
            @RequestParam Sex   sex,
            @RequestParam(required = false) String phone,
            @RequestParam(required = false) String email,
            @RequestParam ProfType profType,
            @RequestParam String licenseNumber,
            @RequestParam(required = false) String specialty,
            Model model) {

        if (userRepo.findByUsername(username).isPresent()) {
            model.addAttribute("error", "Usuario ya existe");
            model.addAttribute("sexValues", Sex.values());
            model.addAttribute("profTypes", ProfType.values());
            return "admin/professional-form";
        }

        UserEntity u = new UserEntity(
                username,
                com.historias.clinicas.general.PasswordUtil.hash(password),
                firstName, lastName, sex, null, phone, email);
        userRepo.save(u);

        profRepo.save(new com.historias.clinicas.entity.Professional(
                u, profType, licenseNumber, specialty));

        return "redirect:/admin/professionals";
    }

    /* ---------- ELIMINAR PROFESIONAL + USUARIO ------------------- */
    @Transactional
    @PostMapping("/professionals/{id}/delete")
    public String deleteProfessional(@PathVariable Integer id) {
        /* 1) quitar registro PROFESSIONAL  2) quitar registro USER  */
        profRepo.deleteById(id);
        userRepo.deleteById(id);
        return "redirect:/admin/professionals";
    }

    /* ===============================================================
     * ===  ADMINISTRADORES  (solo admin primario)                 ===
     * =============================================================== */

    @GetMapping("/admins")
    public String listAdmins(HttpSession s, Model m) {
        if (!isPrimary(s)) return "redirect:/admin/dashboard";
        m.addAttribute("admins", adminRepo.findAll());
        return "admin/admins";
    }

    @GetMapping("/admins/new")
    public String newAdminForm(HttpSession s, Model m) {
        if (!isPrimary(s)) return "redirect:/admin/dashboard";
        m.addAttribute("sexValues", Sex.values());
        return "admin/admin-form";
    }

    @PostMapping("/admins")
    public String createAdmin(
            HttpSession s,
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String firstName,
            @RequestParam String lastName,
            @RequestParam Sex   sex,
            Model model) {

        if (!isPrimary(s)) return "redirect:/admin/dashboard";

        if (userRepo.findByUsername(username).isPresent()) {
            model.addAttribute("error", "Usuario ya existe");
            model.addAttribute("sexValues", Sex.values());
            return "admin/admin-form";
        }

        UserEntity u = new UserEntity(
                username,
                com.historias.clinicas.general.PasswordUtil.hash(password),
                firstName, lastName, sex, null, null, null);
        userRepo.save(u);

        adminRepo.save(new com.historias.clinicas.entity.Admin(u, false));
        return "redirect:/admin/admins";
    }

    /* ---------- ELIMINAR ADMIN + USUARIO ------------------------- */
    @Transactional
    @PostMapping("/admins/{id}/delete")
    public String deleteAdmin(HttpSession s, @PathVariable Integer id) {
        if (!isPrimary(s)) return "redirect:/admin/dashboard";

        UserEntity current = (UserEntity) s.getAttribute("USER");
        if (id.equals(current.getUserId())) {              // evita suicidio
            return "redirect:/admin/admins?error=self";
        }

        adminRepo.deleteById(id);  // 1) tabla admin
        userRepo.deleteById(id);   // 2) tabla users
        return "redirect:/admin/admins";
    }

    /* =============================================================== */
    /* ===  PERFIL PROPIO                                           === */
    /* =============================================================== */

    @GetMapping("/profile/edit")
    public String editProfileForm(HttpSession s, Model m) {
        UserEntity cur = (UserEntity) s.getAttribute("USER");
        Optional<UserEntity> opt = userRepo.findById(cur.getUserId());
        m.addAttribute("user", opt.orElse(cur));
        return "admin/profile_form";
    }

    @PostMapping("/profile/edit")
    public String updateProfile(HttpSession s,
                                @RequestParam String firstName,
                                @RequestParam String lastName,
                                @RequestParam(required = false) String phone,
                                @RequestParam(required = false) String email,
                                @RequestParam(required = false) String password) {

        UserEntity cur = (UserEntity) s.getAttribute("USER");
        userRepo.findById(cur.getUserId()).ifPresent(u -> {
            u.setFirstName(firstName);
            u.setLastName(lastName);
            u.setPhone(phone);
            u.setEmail(email);
            if (password != null && !password.isBlank()) {
                u.setHashPassword(com.historias.clinicas.general.PasswordUtil.hash(password));
            }
            userRepo.save(u);
            s.setAttribute("USER", u);
        });
        return "redirect:/admin/dashboard";
    }

    /* -------------------------------------------------------------- */
    private boolean isPrimary(HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("USER");
        return user != null && adminRepo.existsByUserIdAndPrimaryAdminTrue(user.getUserId());
    }
}
