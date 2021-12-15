package com.neu.webtools.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.neu.webtools.exception.JobsPostedException;
import com.neu.webtools.exception.StudentClassException;
import com.neu.webtools.pojo.AppUsers;
import com.neu.webtools.pojo.JobApplication;
import com.neu.webtools.pojo.JobDetails;

public class StudentDAO extends DAO {

	// Method for returning all jobs
	public List<JobDetails> listAllJobs() throws StudentClassException {
		try {
			begin();
			Query query = getSession().createQuery("from JobDetails");
			System.out.println("INSIDE listAllJobs DAO method");
			List<JobDetails> allJobList = query.list();
			commit();
			close();
			return allJobList;
		} catch (HibernateException e) {
			rollback();
			throw new StudentClassException("Could not find employer", e);
		}
	}

	// Method for uploading files for job application
	public void saveFiles(JobApplication uploadFile) throws StudentClassException {
			try {
				System.out.println("INSIDE saveFiles METHOD");
				begin();
				getSession().save(uploadFile);
				close();
			}catch(HibernateException e) {
				rollback();
				e.printStackTrace();
				throw new StudentClassException("Error occured in uploading files at DAO level",e);
			}
		}
	
	//Method for fetching application id from User id
		public JobApplication getJobId(AppUsers users) throws JobsPostedException{
			try {
				begin();
				Query query = getSession().createQuery("from JobApplication where user = '" + users + "' ");
				System.out.println("INSIDE EMPLOYER DAO update method");
				JobApplication application = (JobApplication) query.uniqueResult();
				commit();
				close();
				return application;
			}catch(HibernateException e) {
				rollback();
				throw new JobsPostedException("Could not update the job at the DAO level", e);
			}
		}
		
		// Criteria method for checking if the Student has already applied for this job
		public boolean userExists(AppUsers user, JobDetails jobdetails)throws StudentClassException{
			try {
				boolean result = true;
				System.out.println("Inside CRITERIA METHOD");
				begin();
				Criteria criteria = getSession().createCriteria(JobApplication.class);
				criteria.add(Restrictions.eq("jobdetails",jobdetails));
				List <JobApplication> results = criteria.list();
				//System.out.println("SIZE1: "/*+ results.size()*/+ " SIZE2: "+ results2.size());
				commit();
				close();
				if(results.size() >= 2) {
						result = true;
					}
					else {
						result = false;
					}
				return result;
				
			}catch(HibernateException e) {
				rollback();
				e.printStackTrace();
				throw new StudentClassException("Error occured in fetching data at DAO level",e);
			}
		}
	
	// Method for listing all applications of the candidate
	public List<JobApplication> listAppliedJobs(AppUsers user)throws StudentClassException{
		
		try {
			System.out.println("INSIDE listAppliedJobs METHOD");
			begin();
			System.out.println("PART1: INSIDE listAppliedJobs DAO METHOD ");
			//List<JobDetails> allJobDetails = new ArrayList<JobDetails>();
			//int userId = user.getUserid();
			Query query = getSession().createQuery("from JobApplication where user = '" + user.getUserid() + "' ");
			List<JobApplication> jobApplications = query.list();
			/*for(JobApplication j : allApplications) {
			Query query1 = getSession().createQuery("from JobDetails where id = '" + j.getJobdetails() + "' ");
				allJobDetails = query1.list();
				//commit();
				//return allJobDetails;
				//close();
			}*/
			commit();
			close();
			return jobApplications;
		}catch(HibernateException e) {
			rollback();
			e.printStackTrace();
			throw new StudentClassException("Error occured in fetching data at DAO level",e);
		}
	}
	
	//Method for listing all the job details based on the job Id
	public List<JobDetails> allJobDetails(long jobId) throws StudentClassException{
		try {
			System.out.println("PART2: INSIDE allJobDetails DAO METHOD ");
			begin();
			Query query = getSession().createQuery("from JobDetails where id = '" + jobId + "' ");
			List<JobDetails> jobDetails = query.list();
			commit();
			close();
			return jobDetails;
		}catch(HibernateException e) {
			rollback();
			e.printStackTrace();
			throw new StudentClassException("Error occured in fetching data at DAO level",e);
		}
	}
	
	//Method for deleting Job Application
		public boolean delete(long jobid) throws StudentClassException{
			try {
				begin();
				Query query = getSession().createQuery("delete from JobApplication where jobdetails = '" + jobid + "' ");
				System.out.println("Inside STUDENT DAO delete method");
				query.executeUpdate();
				commit();
				close();
				return true;
			}catch(HibernateException e) {
				rollback();
				throw new StudentClassException("Error in deleting the job post", e);
			}
		}
}
