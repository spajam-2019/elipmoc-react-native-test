import React from 'react';
import {Text } from 'react-native';
import Axios from "axios";
import Env from '../env'

export default class SettingsScreen extends React.Component {
  constructor(){
      super()
      this.state={text:""}
      Axios.get(Env.BACK_IP)
       .then(x=>{this.setState({text:x.data});})
  }
  static navigationOptions = {
    title: 'Search GitHub Repository',
  };

  render() {
    return <Text>{this.state.text}</Text>;
  }
}
