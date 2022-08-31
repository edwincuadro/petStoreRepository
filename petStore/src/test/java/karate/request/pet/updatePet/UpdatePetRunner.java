package karate.request.pet.updatePet;

import com.intuit.karate.junit5.Karate;
public class UpdatePetRunner {
    @Karate.Test
    Karate updatePet(){
        return Karate.run("classpath:karate/features/pet/3.updatePet/updatePet.feature").relativeTo(getClass());
    }
}
