package per.helper.elderly;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ElderlyApplication {
	public static void main(String[] args) {
		SpringApplication.run(ElderlyApplication.class, args);
		System.out.println("Não aguento mais!");
	}
}
