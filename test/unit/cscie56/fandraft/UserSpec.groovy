package cscie56.fandraft

import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification


@TestFor(User)
class UserSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test blank constraint"() {
        when: 'an object is valid'
        def user = new User(username: 'testuser', firstname: "fn", lastname: "ln", password: 'pw', email: 'addr@addr.com')

        then: 'validate() returns true and there are no errors'

        user.validate()
        !user.hasErrors()
        user.errors.errorCount == 0

        when: 'an object is blank'
        user.username = ''
        user.password = ''
        user.email = ''
        user.firstname = ''
        user.lastname = ''

        then: 'validate() returns false and the appropriate error is created'
        !user.validate()
        user.hasErrors()
        user.errors.errorCount == 5
    }

    void "test email constraing"() {
        when: 'an object is valid'
        def user = new User(username: 'testuser', firstname: "fn", lastname: "ln", password: 'pw', email: 'addr@addr.com')

        then: 'validate() returns true and there are no errors'

        user.validate()
        !user.hasErrors()
        user.errors.errorCount == 0

        when: 'an email is malformed'

        user.email = 'a@'


        then: 'validate() returns false and the appropriate error is created'
        !user.validate()
        user.hasErrors()
        user.errors.errorCount == 1
    }

    void "test unique constraint"() {
        when: 'two objects are valid'
        def user1 = new User(username: 'testuser1', firstname: "fn", lastname: "ln", password: 'pw', email: 'addr1@addr.com')
        def user2 = new User(username: 'testuser2', firstname: "fn", lastname: "ln", password: 'pw', email: 'addr2@addr.com')

        then: 'validate() returns true and there are no errors'

        user1.save(flush: true)
        !user1.hasErrors()
        user1.errors.errorCount == 0

        user2.save(flush: true)
        !user2.hasErrors()
        user2.errors.errorCount == 0

        when: 'two objects arent unique'
        user1.username = user2.username
        user1.email = user2.email

        then: 'validate() returns false and the appropriate errors are created'
        !user1.validate()
        user1.hasErrors()
        user1.errors.errorCount == 2
    }
}
