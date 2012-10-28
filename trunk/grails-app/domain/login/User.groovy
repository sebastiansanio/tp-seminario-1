package login
import seminario.*

class User {
    String username
    String passwordHash
    
    static hasMany = [ roles: Role, permissions: String, rols: Rol ]

    static constraints = {
        username(nullable: false, blank: false, unique: true)
    }
}
