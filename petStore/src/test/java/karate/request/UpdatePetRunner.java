package karate.request;

import com.intuit.karate.junit5.Karate;
public class UpdatePetRunner {
    @Karate.Test
    Karate updatePet(){
        return Karate.run("classpath:karate/features/updatePet.feature").relativeTo(getClass());
    }
}
