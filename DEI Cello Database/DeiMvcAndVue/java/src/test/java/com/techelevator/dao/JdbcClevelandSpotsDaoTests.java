package com.techelevator.dao;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class JdbcClevelandSpotsDaoTests extends BaseDaoTests {

//        protected static final ThingToDo Thing_1 = new ThingToDo(1,"https://vacationidea.com/pix/img25Hy8R/destinations/t-t4_cleveland_cultural_gardens_5447_mobi.jpg","The Cleveland Cultural Gardens are a collection of public gardens located in Rockefeller Park in Cleveland, Ohio. The gardens are situated along East Boulevard & Martin Luther King Jr. Drive within the 276 acre of wooded parkland on the citys East Side",
//                "Cleveland Cultural Gardens", "Test", BigDecimal.valueOf(50.215646548486), BigDecimal.valueOf(-6.15464848), "10pm - 10pm", true, true, "fast-food", true, 4.90);
//        protected static final ThingToDo Thing_2 = new ThingToDo(1,"https://vacationidea.com/pix/img25Hy8R/destinations/best-things-to-do-in-cleveland_g22_mobi.jpg","The Cleveland Metroparks Zoo aka Cleveland Zoological Park is a 183-acre zoo in Cleveland, Ohio. The Zoo is divided into several areas: Australian Adventure; African Savanna; Northern Wilderness Trek, The Primate, Cat & Aquatics Building, Waterfowl Lake, The RainForest, and the newly added Asian Highlands",
//            "Cleveland Test 2", "Test 2", BigDecimal.valueOf(10.1111111111111), BigDecimal.valueOf(-2.22222222222), "2pm - 2pm", false, false, "fast-food", false, 2.22);


        private JdbcClevelandSpotsDao sut;

        @Before
        public void setup() {
            JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
            sut = new JdbcClevelandSpotsDao(jdbcTemplate);
        }

        @Test
        public void getAllSpots_returns_all_spots(){
            List<ThingToDoDto> thingToDoDtos = sut.findAll();
            Assert.assertEquals(76, thingToDoDtos.size());
        }
        @Test
        public void get_all_free_admission_locations(){
            List<ThingToDoDto> thingToDoDtos = sut.findFreeActivities();
            Assert.assertEquals(18, thingToDoDtos.size());
        }

////       TODO Not sure if this test is working properly!
//        @Test
//        public void created_returns_true(){
//            Assert.assertTrue(sut.create(Thing_2));
//        }
    }
