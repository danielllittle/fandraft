package cscie56.fandraft.job

import cscie56.fandraft.League
import grails.test.mixin.TestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

import java.awt.Color

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
class DraftJobSpec extends Specification {

    def setup() {
        League league = new League(drafted: false, name: 'draftjobspectest', color: Color.black);
    }

    def cleanup() {
    }

    void "test league draft lock"() {
    }
}
