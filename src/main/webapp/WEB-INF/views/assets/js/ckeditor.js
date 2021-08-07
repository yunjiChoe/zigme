BasicEditor
	.create( document.querySelector('#postContent')) 

    .then( editor => { 

        console.log( editor ); 

    } ) 

    .catch( error => { 

        console.error( error ); 

    } );