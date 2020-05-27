import React from 'react';

import GiphysIndex from './giphys_index';

export default class giphysSearch extends React.Component {
    constructor({ fetchSearchGiphys, giphys }){
        super({ fetchSearchGiphys, giphys })
        this.state = {searchTerm: "", gifs: []}
        this.fetchSearchGiphys = fetchSearchGiphys
        this.handleChange = this.handleChange.bind(this)
        this.handleSubmit = this.handleSubmit.bind(this)
    }

    handleChange (e){
        this.setState({
            searchTerm: e.target.value
        })      
    }

    handleSubmit (e){
        e.preventDefault();
        this.fetchSearchGiphys(this.state.searchTerm)
    }

    render (){
        return (
            <div>
                <form onSubmit={this.handleSubmit}>
                    <input type="text" value={this.state.searchTerm} onChange={this.handleChange}/>
                    <input type="submit" value="search" />
                </form>
                < GiphysIndex gifs={this.state.gifs}/>
            </div>
        )
    }
}
