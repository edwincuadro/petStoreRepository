package karate.request.pet.deletePet;

import com.intuit.karate.junit5.Karate;
public class DeletePet {
    @Karate.Test
    Karate DeletePet(){
        return Karate.run("classpath:karate/features/pet/4.deletePet/zdeletePet.feature").relativeTo(getClass());
    }
}
