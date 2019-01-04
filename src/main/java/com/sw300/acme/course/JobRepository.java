package com.sw300.acme.course;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource(collectionResourceRel = "job", path = "jobs")
public interface JobRepository extends PagingAndSortingRepository<Job, Long> {
}