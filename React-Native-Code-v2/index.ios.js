/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';

export default class HelloWorldTom extends Component {
    constructor() {
        super();
        this.state = {
            movieTitle1: '',
            movieYear1: '',
            movieTitle2: '',
            movieYear2: '',
            name: 'Tom'
        }
    }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Hello World {this.state.name}!
        </Text>
        <Text style={styles.instructions}>
          Here is your profile info:
        </Text>
        <Text style={styles.instructions}>
            {this.state.movieTitle1} : {this.state.movieYear1}
        </Text>
          <Text style={styles.instructions}>
            {this.state.movieTitle2} : {this.state.movieYear2}
        </Text>
      </View>
    );
  }

  componentWillMount() {
      fetch('https://facebook.github.io/react-native/movies.json')
          .then((response) => response.json())
          .then((responseJson) => {
              this.setState({ movieTitle1: responseJson.movies[0].title });
              this.setState({ movieYear1: responseJson.movies[0].releaseYear });
              this.setState({ movieTitle2: responseJson.movies[1].title });
              this.setState({ movieYear2: responseJson.movies[1].releaseYear });
          })
          .catch((error) => {
              console.error(error);
          });
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('HelloWorldTom', () => HelloWorldTom);
