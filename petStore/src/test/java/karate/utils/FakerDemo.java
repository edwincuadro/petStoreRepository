package karate.utils;

import com.github.javafaker.Faker;
public class FakerDemo {
    public static void main(String[] args) {
        Faker fake = new Faker();
        String city = fake.address().city();
        String id = fake.idNumber().valid();
        System.out.println(city);
        System.out.println(fake.country().currency());
    }
}
