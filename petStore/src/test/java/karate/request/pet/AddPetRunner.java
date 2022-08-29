package karate.request.pet;

import com.intuit.karate.junit5.Karate;

public class AddPetRunner {
    @Karate.Test
    Karate AddPetTest() {
        return Karate.run("classpath:karate/features/pet/addPet.feature").relativeTo(getClass());
    }
}
