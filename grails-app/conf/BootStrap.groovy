import cscie56.fandraft.UserRole
import cscie56.fandraft.Role
import cscie56.fandraft.User

class BootStrap {

    def init = { servletContext ->

        def adminRole = Role.findOrSaveWhere(authority : "ROLE_ADMIN")
        def adminUser = User.findOrSaveWhere(username: "admin", password: 'admin')

        if (!adminUser.authorities.contains(adminRole)) {
            UserRole.create(adminUser, adminRole, true);
        }

        def userRole = Role.findOrSaveWhere(authority : "ROLE_USER")
        def testUser = User.findOrSaveWhere(username: "test", password: 'test')

        if (!testUser.authorities.contains(userRole)) {
            UserRole.create(testUser, userRole, true);
        }

    }
    def destroy = {
    }
}
