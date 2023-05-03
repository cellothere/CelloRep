package com.techelevator.controller;

import com.techelevator.dao.CelloPiecesDao;
import com.techelevator.model.CelloPiece;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cello-pieces")
@PreAuthorize("permitAll()")
@CrossOrigin
public class CelloPiecesController {

    private final CelloPiecesDao celloPiecesDao;

    public CelloPiecesController(CelloPiecesDao celloPiecesDao) {
        this.celloPiecesDao = celloPiecesDao;
    }

    @GetMapping
    public ResponseEntity<List<CelloPiece>> getAllCelloPieces() {
        List<CelloPiece> celloPieces = celloPiecesDao.getAllCelloPieces();
        return new ResponseEntity<>(celloPieces, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<CelloPiece> getCelloPieceById(@PathVariable int id) {
        CelloPiece celloPiece = celloPiecesDao.getCelloPieceById(id);
        if (celloPiece != null) {
            return new ResponseEntity<>(celloPiece, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/create")
    public ResponseEntity<Void> createCelloPiece(@RequestBody CelloPiece celloPiece) {
        celloPiecesDao.createCelloPiece(celloPiece);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<Void> updateCelloPiece(@PathVariable int id, @RequestBody CelloPiece celloPiece) {
        celloPiece.setPieceId(id);
        celloPiecesDao.updateCelloPiece(celloPiece);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deleteCelloPiece(@PathVariable int id) {
        celloPiecesDao.deleteCelloPiece(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @GetMapping("/composers/{composerId}")
    public List<CelloPiece> getCelloPiecesByComposerId(@PathVariable int composerId) {
        return celloPiecesDao.getCelloPiecesByComposerId(composerId);
    }
}