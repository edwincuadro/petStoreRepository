package karate.request.pet.addPet;

import com.intuit.karate.junit5.Karate;

public class AddPetRunner {
    @Karate.Test
    Karate AddPetTest() {
        return Karate.run("classpath:karate/features/pet/1.addPet/addPet.feature").relativeTo(getClass());
    }
}
