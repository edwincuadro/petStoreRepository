package karate.request;

import com.intuit.karate.junit5.Karate;

public class AddPetRunner {
    @Karate.Test
    Karate AddPetTest() {
        return Karate.run("classpath:karate/features/addPet.feature").relativeTo(getClass());
    }
}
