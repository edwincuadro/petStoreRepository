package karate.request.pet;

import com.intuit.karate.junit5.Karate;
public class UpdatePetRunner {
    @Karate.Test
    Karate updatePet(){
        return Karate.run("classpath:karate/features/pet/updatePet.feature").relativeTo(getClass());
    }
}
