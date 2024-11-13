package DAO;

import Model.Show;
import Model.Theatre;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ShowDAOImpl implements ShowDAO {
    @Override
    public List<Show> getShowByTheatreAndShowTimeBetween(Theatre theatre, LocalDate startDate,
                                                         LocalDate endDate) {
        String sql = String.format("select * from show where theatreId = %d and " +
                "showTime between (%s, %s)", theatre.getTheatreId(), startDate.toString(),
                endDate.toString());
        // map RelationalEntity(showId, movieId, screenId, showTime) to Show(showId, Movie,
        // Screen, showTime) ??
        return new ArrayList<>();
    }
}
