package cscie56.fandraft

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Player)
class PlayerSpec extends Specification {

    def player = new Player( name: "playername", position : Position.CATCHER ) {
    }

    def cleanup() {
    }

    void "test something"() {
    }
}
