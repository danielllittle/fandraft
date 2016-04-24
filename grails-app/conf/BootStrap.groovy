import cscie56.fandraft.UserRole
import cscie56.fandraft.Role
import cscie56.fandraft.User

class BootStrap {

    def init = { servletContext ->

        def adminRole = Role.findOrSaveWhere(authority : "ROLE_ADMIN")
        def adminUser = User.findOrSaveWhere(username: "admin@fandraft.com", password: 'password')

        if (!adminUser.authorities.contains(adminRole)) {
            UserRole.create(adminUser, adminRole, true);
        }

    }
    def destroy = {
    }
}
