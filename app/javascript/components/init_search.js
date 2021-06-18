import axios from 'axios';
var RAILS_ENV = $('#RAILS_ENV_CONSTANT').text();

const initSearch = () => {
  const searchElement = document.getElementById("search-game").addEventListener("keyup", (event) => {
    // fetch("https://api.igdb.com/v4/games", {
    //   method: "POST",
    //   headers: {
    //     'Accept': 'application/json',
    //     'Access-Control-Allow-Origin': '*',
    //     'Client-ID': 'mf3ro43i7uma3cazi12x80zuv2kqlb',
    //     'Authorization-Type': 'Bearer 1n3rje8cxbnlzjf8gcrogfql40q7ob'
    //   },
    //   data: "fields artworks,category,collection,cover,game_modes,genres,name,rating,slug; search 'Pokemon';"
    // })
    //   .then(response => response.json())
    //   .then((data) => {
    //     console.log(data); // Look at local_names.default
    //   });
    axios({
      url: "https://api.igdb.com/v4/games",
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Client-ID': 'mf3ro43i7uma3cazi12x80zuv2kqlb',
        'Authorization': 'Bearer 1n3rje8cxbnlzjf8gcrogfql40q7ob',
      },
      data: "fields age_ratings,aggregated_rating,aggregated_rating_count,alternative_names,artworks,bundles,category,checksum,collection,cover,created_at,dlcs,expanded_games,expansions,external_games,first_release_date,follows,forks,franchise,franchises,game_engines,game_modes,genres,hypes,involved_companies,keywords,multiplayer_modes,name,parent_game,platforms,player_perspectives,ports,rating,rating_count,release_dates,remakes,remasters,screenshots,similar_games,slug,standalone_expansions,status,storyline,summary,tags,themes,total_rating,total_rating_count,updated_at,url,version_parent,version_title,videos,websites;"
    })
      .then(response => {
        console.log(response.data);
      })
      .catch(err => {
        console.error(err);
      });
  })
}

export { initSearch };