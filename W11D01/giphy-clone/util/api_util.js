import apiKey from './giphy_api_key'

export const fetchSearchGiphys = (searchTerm) => {
    console.log(`http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=${apiKey}&limit=2`)
    return $.ajax({
        url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=${apiKey}&limit=2`,
        method: 'get',
    })
}