import React from 'react';
import {Text } from 'react-native';
import { ApiClient } from '../ApiClient';

export default class SettingsScreen extends React.Component {
  constructor(){
      super()
      this.state={text:""}

      new ApiClient().FindRepositories("ruscall")
       .then(x=>this.setState({text:JSON.stringify(x.data)}))
  }
  static navigationOptions = {
    title: 'Search GitHub Repository',
  };

  render() {
    return <Text>{this.state.text}</Text>;
  }
}
