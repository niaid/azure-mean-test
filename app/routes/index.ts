var express = require('express');
var router = express.Router();
import axios from 'axios';

interface IResult {
  name: string
  result: string
}

/* GET home page. */
router.get('/', async function(req, res, next) {

  var options = {
    url: 'https://github.niaid.nih.gov',
    timeout: 5000
  };

  let results: IResult[] = [];

  await axios.request(options).then( response => {
    results.push( { name: options.url, result: response.data } ) ;
  } ).catch( reason => {
    results.push( { name: options.url, result: reason } ) ;
  } );

  res.render( 'index', { title: 'SEB connection tests', results: results });
  
});

module.exports = router;
