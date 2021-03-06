// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.entityformat.service.impl;

import io.springlets.data.domain.GlobalSearch;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.entityformat.domain.Owner;
import org.springframework.roo.entityformat.domain.OwnerCityFormBean;
import org.springframework.roo.entityformat.domain.OwnerFirstNameFormBean;
import org.springframework.roo.entityformat.domain.OwnerInfo;
import org.springframework.roo.entityformat.domain.Pet;
import org.springframework.roo.entityformat.repository.OwnerRepository;
import org.springframework.roo.entityformat.service.api.OwnerService;
import org.springframework.roo.entityformat.service.api.PetService;
import org.springframework.roo.entityformat.service.impl.OwnerServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect OwnerServiceImpl_Roo_Service_Impl {
    
    declare parents: OwnerServiceImpl implements OwnerService;
    
    declare @type: OwnerServiceImpl: @Service;
    
    declare @type: OwnerServiceImpl: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated attribute documentation
     */
    private OwnerRepository OwnerServiceImpl.ownerRepository;
    
    /**
     * TODO Auto-generated attribute documentation
     */
    private PetService OwnerServiceImpl.petService;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param ownerRepository
     * @param petService
     */
    @Autowired
    public OwnerServiceImpl.new(OwnerRepository ownerRepository, @Lazy PetService petService) {
        this.ownerRepository = ownerRepository;
        this.petService = petService;
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @param owner
     * @param petsToAdd
     * @return Owner
     */
    @Transactional
    public Owner OwnerServiceImpl.addToPets(Owner owner, Iterable<Long> petsToAdd) {
        List<Pet> pets = petService.findAll(petsToAdd);
        owner.addToPets(pets);
        return ownerRepository.save(owner);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param owner
     * @param petsToRemove
     * @return Owner
     */
    @Transactional
    public Owner OwnerServiceImpl.removeFromPets(Owner owner, Iterable<Long> petsToRemove) {
        List<Pet> pets = petService.findAll(petsToRemove);
        owner.removeFromPets(pets);
        return ownerRepository.save(owner);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param owner
     * @param pets
     * @return Owner
     */
    @Transactional
    public Owner OwnerServiceImpl.setPets(Owner owner, Iterable<Long> pets) {
        List<Pet> items = petService.findAll(pets);
        Set<Pet> currents = owner.getPets();
        Set<Pet> toRemove = new HashSet<Pet>();
        for (Iterator<Pet> iterator = currents.iterator(); iterator.hasNext();) {
            Pet nextPet = iterator.next();
            if (items.contains(nextPet)) {
                items.remove(nextPet);
            } else {
                toRemove.add(nextPet);
            }
        }
        owner.removeFromPets(toRemove);
        owner.addToPets(items);
        return ownerRepository.save(owner);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param owner
     */
    @Transactional
    public void OwnerServiceImpl.delete(Owner owner) {
        // Clear bidirectional one-to-many parent relationship with Pet
        for (Pet item : owner.getPets()) {
            item.setOwner(null);
        }
        
        ownerRepository.delete(owner);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entities
     * @return List
     */
    @Transactional
    public List<Owner> OwnerServiceImpl.save(Iterable<Owner> entities) {
        return ownerRepository.save(entities);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     */
    @Transactional
    public void OwnerServiceImpl.delete(Iterable<Long> ids) {
        List<Owner> toDelete = ownerRepository.findAll(ids);
        ownerRepository.deleteInBatch(toDelete);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entity
     * @return Owner
     */
    @Transactional
    public Owner OwnerServiceImpl.save(Owner entity) {
        return ownerRepository.save(entity);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Owner
     */
    public Owner OwnerServiceImpl.findOne(Long id) {
        return ownerRepository.findOne(id);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @return List
     */
    public List<Owner> OwnerServiceImpl.findAll(Iterable<Long> ids) {
        return ownerRepository.findAll(ids);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return List
     */
    public List<Owner> OwnerServiceImpl.findAll() {
        return ownerRepository.findAll();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    public long OwnerServiceImpl.count() {
        return ownerRepository.count();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Owner> OwnerServiceImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        return ownerRepository.findAll(globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Owner> OwnerServiceImpl.findByFirstNameLike(OwnerFirstNameFormBean formBean, GlobalSearch globalSearch, Pageable pageable) {
        return ownerRepository.findByFirstNameLike(formBean, globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<OwnerInfo> OwnerServiceImpl.findByCityLike(OwnerCityFormBean formBean, GlobalSearch globalSearch, Pageable pageable) {
        return ownerRepository.findByCityLike(formBean, globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @return Long
     */
    public long OwnerServiceImpl.countByFirstNameLike(OwnerFirstNameFormBean formBean) {
        return ownerRepository.countByFirstNameLike(formBean);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @return Long
     */
    public long OwnerServiceImpl.countByCityLike(OwnerCityFormBean formBean) {
        return ownerRepository.countByCityLike(formBean);
    }
    
}
