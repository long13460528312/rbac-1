package com.offcn.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
public class SourcesServiceImplTest {

    @Autowired
    private JedisPool jedisPool;

    @Test
    public void t1(){
        Jedis resource = jedisPool.getResource();
        resource.set("d1","demo1");
        resource.set("d2","demo2");
        System.out.println(resource.get("d1"));
        System.out.println(resource.get("d2"));
        resource.close();
        jedisPool.close();
    }
}