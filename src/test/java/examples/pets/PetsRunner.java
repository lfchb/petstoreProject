package examples.pets;

import com.intuit.karate.junit5.Karate;

public class PetsRunner {

    @Karate.Test
    Karate getPets(){
        return Karate.run("pets").relativeTo(getClass());
    }
}
