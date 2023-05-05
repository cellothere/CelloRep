package com.techelevator.dao;

import com.techelevator.model.CelloPiece;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcCelloPiecesDao implements CelloPiecesDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcCelloPiecesDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<CelloPiece> getAllCelloPieces() {
        List<CelloPiece> celloPieces = new ArrayList<>();
        String sql = "SELECT * FROM cello_pieces";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while (results.next()) {
            celloPieces.add(mapRowToCelloPiece(results));
        }

        return celloPieces;
    }

    @Override
    public List<CelloPiece> getCelloPiecesByComposerId(int composerId) {
        List<CelloPiece> celloPieces = new ArrayList<>();
        String sql = "SELECT * FROM cello_pieces WHERE composer_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, composerId);

        while (results.next()) {
            celloPieces.add(mapRowToCelloPiece(results));
        }

        return celloPieces;
    }

    @Override
    public CelloPiece getCelloPieceById(int pieceId) {
        String sql = "SELECT * FROM cello_pieces WHERE piece_id = ?";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, pieceId);

        if (result.next()) {
            return mapRowToCelloPiece(result);
        } else {
            return null;
        }
    }

    @Override
    public void createCelloPiece(CelloPiece celloPiece) {
        String sql = "INSERT INTO cello_pieces (piece_id, piece_name, composer_id, suzuki_book_level_id, isArrangement, audio_link, sheet_music_link, publisher_info, description, technical_overview, is_public_domain, where_to_buy_or_download, duration) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, celloPiece.getPieceId(), celloPiece.getPieceName(),
                celloPiece.getComposerId(), celloPiece.getSuzukiBookLevelId(), celloPiece.isArrangement(),
                celloPiece.getAudioLink(), celloPiece.getSheetMusicLink(), celloPiece.getPublisherInfo(),
                celloPiece.getDescription(), celloPiece.getTechnicalOverview(), celloPiece.isPublicDomain(),
                celloPiece.getWhereToBuyOrDownload(), celloPiece.getDuration());
    }

    @Override
    public void updateCelloPiece(CelloPiece celloPiece) {
        String sql = "UPDATE cello_pieces SET piece_name = ?, composer_id = ?, suzuki_book_level_id = ?, isArrangement = ?, " +
                "audio_link = ?, sheet_music_link = ?, publisher_info = ?, description = ?, technical_overview = ?, " +
                "is_public_domain = ?, where_to_buy_or_download = ?, duration = ? WHERE piece_id = ?";
        jdbcTemplate.update(sql, celloPiece.getPieceName(), celloPiece.getComposerId(),
                celloPiece.getSuzukiBookLevelId(), celloPiece.isArrangement(), celloPiece.getAudioLink(),
                celloPiece.getSheetMusicLink(), celloPiece.getPublisherInfo(), celloPiece.getDescription(),
                celloPiece.getTechnicalOverview(), celloPiece.isPublicDomain(), celloPiece.getWhereToBuyOrDownload(), celloPiece.getDuration(), celloPiece.getPieceId());
    }

    @Override
    public void deleteCelloPiece(int pieceId) {
        String sql = "DELETE FROM cello_pieces WHERE piece_id = ?";
        jdbcTemplate.update(sql, pieceId);
    }

    private CelloPiece mapRowToCelloPiece(SqlRowSet row) {
        CelloPiece celloPiece = new CelloPiece();
        celloPiece.setPieceId(row.getInt("piece_id"));
        celloPiece.setPieceName(row.getString("piece_name"));
        celloPiece.setComposerId(row.getInt("composer_id"));
        celloPiece.setSuzukiBookLevelId(row.getInt("suzuki_book_level_id"));
        celloPiece.setArrangement(row.getBoolean("isArrangement"));
        celloPiece.setAudioLink(row.getString("audio_link"));
        celloPiece.setSheetMusicLink(row.getString("sheet_music_link"));
        celloPiece.setPublisherInfo(row.getString("publisher_info"));
        celloPiece.setDescription(row.getString("description"));
        celloPiece.setTechnicalOverview(row.getString("technical_overview"));
        celloPiece.setPublicDomain(row.getBoolean("is_public_domain"));
        celloPiece.setWhereToBuyOrDownload(row.getString("where_to_buy_or_download"));
        celloPiece.setDuration(row.getString("duration"));
        return celloPiece;
    }
}

