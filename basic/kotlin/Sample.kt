interface SecureInfo {
    fun maskCredentials(user: String, password: String): String
}

object Masker : SecureInfo {
    override fun maskCredentials(user: String, password: String): String {
        return "User: ${user.take(2)}*** | Password: ${password.repeat(password.length)}"
    }
}

class SecurityUtils {
    companion object : SecureInfo by Masker
}

class SecurityManager(delegate: SecureInfo) : SecureInfo by delegate

fun main() {
    val password = "PASSWORD"
    val user = System.getenv("username") ?: "guest"

    println("Companion Output: ${SecurityUtils.maskCredentials(user, password)}")

    val manager = SecurityManager(Masker)

    println("Named Object Output: ${manager.maskCredentials(user, password)}")
}