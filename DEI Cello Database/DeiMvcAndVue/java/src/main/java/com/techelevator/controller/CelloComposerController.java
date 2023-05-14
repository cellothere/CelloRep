package com.techelevator.controller;

import com.techelevator.dao.CelloComposerDao;
import com.techelevator.model.CelloComposer;
import com.techelevator.model.ComposerNameRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.sql.SQLException;
import java.util.List;

@RestController
@RequestMapping("/composers")
@PreAuthorize("permitAll()")
@CrossOrigin
public class CelloComposerController {

    private final CelloComposerDao celloComposerDao;

    public CelloComposerController(CelloComposerDao celloComposerDao) {
        this.celloComposerDao = celloComposerDao;
    }

    @GetMapping
    public ResponseEntity<List<CelloComposer>> getAllComposers() {
        try {
            List<CelloComposer> composers = celloComposerDao.getAllComposers();
            return new ResponseEntity<>(composers, HttpStatus.OK);
        } catch (SQLException e) {
            // Handle exceptions
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<CelloComposer> getComposerById(@PathVariable int id) {
        try {
            CelloComposer composer = celloComposerDao.getComposerById(id);
            if (composer != null) {
                return new ResponseEntity<>(composer, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (SQLException e) {
            // Handle exceptions
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/create")
    public ResponseEntity<Void> addComposer(@RequestBody CelloComposer composer) {
        try {
            celloComposerDao.addComposer(composer);
            return new ResponseEntity<>(HttpStatus.CREATED);
        } catch (SQLException e) {
            // Handle exceptions
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<Void> updateComposer(@PathVariable int id, @RequestBody CelloComposer composer) {
        try {
            composer.setComposerId(id);
            celloComposerDao.updateComposer(composer);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (SQLException e) {
            // Handle exceptions
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/getId")
    public ResponseEntity<Integer> getComposerIdByComposerName(@RequestBody ComposerNameRequest request) {
        try {
            String composerName = request.getComposerName();
            Integer composerId = celloComposerDao.getComposerIdByComposerName(composerName);
            if (composerId != null) {
                return ResponseEntity.ok(composerId);
            }
            return ResponseEntity.notFound().build();
        } catch (SQLException e) {
            // Handle SQLException with detailed error message
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(null);
        }
    }

    @GetMapping("/{id}/wikipedia-article")
    public ResponseEntity<String> getWikipediaArticleByComposerId(@PathVariable int id) {
        try {
            String wikipediaArticle = celloComposerDao.getWikipediaArticleByComposerId(id);
            if (wikipediaArticle != null) {
                return new ResponseEntity<>(wikipediaArticle, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (SQLException e) {
            // Handle exceptions
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deleteComposer(@PathVariable int id) {
        try {
            celloComposerDao.deleteComposer(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (SQLException e) {
            // Handle exceptions
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}