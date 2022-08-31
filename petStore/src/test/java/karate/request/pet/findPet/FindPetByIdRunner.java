package karate.request.pet.findPet;

import com.intuit.karate.junit5.Karate;
public class FindPetByIdRunner {
    @Karate.Test
    Karate FindPetById(){
        return Karate.run("classpath:karate/features/pet/2.findPet/findPetById.feature").relativeTo(getClass());
    }
}
