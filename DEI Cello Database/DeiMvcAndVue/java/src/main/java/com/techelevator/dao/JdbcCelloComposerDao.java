package com.techelevator.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.techelevator.model.CelloComposer;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.techelevator.model.User;

@Component
public class JdbcCelloComposerDao implements CelloComposerDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcCelloComposerDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<CelloComposer> getAllComposers() throws SQLException {
        List<CelloComposer> composers = new ArrayList<>();
        String sql = "SELECT * FROM cello_composers";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql);
        while (rowSet.next()) {
            CelloComposer composer = mapRow(rowSet);
            composers.add(composer);
        }
        return composers;
    }

    @Override
    public CelloComposer getComposerById(int id) throws SQLException {
        String sql = "SELECT * FROM cello_composers WHERE composer_id = ?";
        try {
            SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql, id);
            if (rowSet.next()) {
                return mapRow(rowSet);
            }
        } catch (EmptyResultDataAccessException e) {
            // Handle case where no composer with given ID is found
        }
        return null;
    }

    @Override
    public Integer getComposerIdByComposerName(String name) throws SQLException {
        String sql = "SELECT composer_id FROM cello_composers WHERE composer_name = ?;";
        try {
            Integer foundComposerId = jdbcTemplate.queryForObject(sql, Integer.class, name);
            return foundComposerId;
        } catch (EmptyResultDataAccessException e) {
            throw new IllegalArgumentException("No composer with the given name found.");
        } catch (Exception e) {
            throw new SQLException("Error retrieving composer ID.", e);
        }
    }

    @Override
    public void addComposer(CelloComposer composer) throws SQLException {
        String sql = "INSERT INTO cello_composers (composer_id, composer_name, composer_bio) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, composer.getComposerId(), composer.getComposerName(), composer.getComposerBio());
    }

    @Override
    public void updateComposer(CelloComposer composer) throws SQLException {
        String sql = "UPDATE cello_composers SET composer_name = ?, composer_bio = ? WHERE composer_id = ?";
        jdbcTemplate.update(sql, composer.getComposerName(), composer.getComposerBio(), composer.getComposerId());
    }

    @Override
    public void deleteComposer(int id) throws SQLException {
        String sql = "DELETE FROM cello_composers WHERE composer_id = ?";
        jdbcTemplate.update(sql, id);
    }
    @Override
    public String getWikipediaArticleByComposerId(int id) throws SQLException {
        String sql = "SELECT wikipedia_article FROM cello_composers WHERE composer_id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, String.class, id);
        } catch (EmptyResultDataAccessException e) {
            // Handle case where no composer with given ID is found
        }
        return null;
    }

    private CelloComposer mapRow(SqlRowSet rs) {
        CelloComposer composer = new CelloComposer();
        composer.setComposerId(rs.getInt("composer_id"));
        composer.setComposerName(rs.getString("composer_name"));
        composer.setComposerBio(rs.getString("composer_bio"));
        composer.setWikipediaLink(rs.getString("wikipedia_article"));
        return composer;
    }
}

