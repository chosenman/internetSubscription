package com.codingdojo.belta.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.codingdojo.belta.models.PackageModel;
import com.codingdojo.belta.models.User;
import com.codingdojo.belta.repositories.PackageRepository;
import com.codingdojo.belta.repositories.UserRepository;

@Service
public class PackageService {
	
	private PackageRepository packageRepository;
	private UserRepository userRepository;
	public PackageService(PackageRepository packageRepository, UserRepository userRepository) {
		this.packageRepository = packageRepository;
		this.userRepository = userRepository;
	}
	
	public void setNewPackage(PackageModel pack) {
		packageRepository.save(pack);
	}
	public List<PackageModel> findAll(){
		return (List<PackageModel>) packageRepository.findAll();
	}
	public PackageModel findOne(Long id) {
		return packageRepository.findOne(id);
	}
	public void activatePack(Long id) {
		PackageModel pack =  packageRepository.findOne(id);
		pack.setAvailable(true);
		packageRepository.save(pack);
	}
	public void deactivatePack(Long id) {
		PackageModel pack =  packageRepository.findOne(id);
		pack.setAvailable(false);
		packageRepository.save(pack);
	}
	
	public void deletePack(Long id) {
		List<User> users = (List<User>) userRepository.findAll();
         for(User user : users) {
     	 	if(user.getChoosed_package() != null && user.getChoosed_package().getId().equals(id)) { 	

		     	 		user.setChoosed_package(null);
		     	 		user.setDueDate(null);
		     	 		userRepository.save(user);

     	 		}
         }
         PackageModel pack = packageRepository.findOne(id);

        	 packageRepository.delete(pack);

		
	}
}
