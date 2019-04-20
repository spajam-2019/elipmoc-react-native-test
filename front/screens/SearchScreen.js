import React from 'react';
import {Text,View,TextInput ,Button,ScrollView} from 'react-native';
import { ApiClient } from '../ApiClient';

export default class SettingsScreen extends React.Component {
  constructor(){
      super()
      this.state={search_text:"検索ワードを入れてください",now_page:0,page_count:0,repos:[]}
  }
  static navigationOptions = {
    title: 'Search GitHub Repository',
  };

  search(){
    new ApiClient().FindRepositories(this.state.search_text)
    .then(x=>this.setState({
      now_page:x.now_page,
      page_count:x.page_count,
      repos:x.repos
     }))
  }

  render() {
    return <View> 
      <TextInput
        style={{height: 40, borderColor: 'gray', borderWidth: 1}}
        onChangeText={(text) => this.setState({search_text:text})}
        value={this.state.search_text}
      />
      <Button title="search" onPress={()=>this.search()}/>
      <ScrollView>
      {this.state.repos.map(repo=>
        <Text key={repo.id}>{repo.name}</Text>
      )}
      <Text>現在のページ：{this.state.now_page}</Text>
      <Text>ページ数：{this.state.page_count}</Text>
      </ScrollView>
    </View>;
  }
}
