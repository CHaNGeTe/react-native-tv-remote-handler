import * as React from 'react';

import { StyleSheet, View, Text, TouchableOpacity } from 'react-native';
import { useTVRemoteHandler } from 'react-native-tv-remote-handler';

export default function App() {
  const [result, setResult] = React.useState<number | undefined>();

  useTVRemoteHandler((result) => {
    console.log('result', result);
  });

  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.to} />
      <TouchableOpacity style={styles.to} />
      <TouchableOpacity style={styles.to} />
      <TouchableOpacity style={styles.to} />
      <TouchableOpacity style={styles.to} />
      <TouchableOpacity style={styles.to} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'row',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
  to: {
    width: 200,
    height: 200,
    borderWidth: 1,
    borderColor: 'red',
  },
});
