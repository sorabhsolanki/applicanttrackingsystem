package com.applicant.dao;

import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.gridfs.GridFsTemplate;
import org.springframework.stereotype.Repository;

import com.mongodb.DBObject;
import com.mongodb.gridfs.GridFSDBFile;

@Repository
public class ResumeStorageDaoImpl implements ResumeStorageDao{

	@Autowired
	GridFsTemplate gridFsTemplate;
	
	@Override
	public String store(InputStream inputStream, String fileName, String contentType, DBObject metaData) {
		return gridFsTemplate.store(inputStream, fileName, contentType, metaData).toString();
	}

	@Override
	public GridFSDBFile retrive(String fileName) {
		return null;
	}

	@Override
	public GridFSDBFile getById(String id) {
		return null;
	}

	@Override
	public GridFSDBFile getByFilename(String filename) {
		return gridFsTemplate.findOne(new Query(Criteria.where("filename").is(filename)));
	}

	@Override
	public List<GridFSDBFile> findAll() {
		return null;
	}

}
