var express = require('express');
var app = express();

app.get("/", function(req, res) {
    //res.send("ho ho ho");
    res.setHeader('Content-Type', 'application/json');
    res.send(JSON.stringify({
            fName: "Tom",
            products: [
                {name: "Orange Product", productCode: "3451356"},
                {name: "Blue Product", productCode: "834342"}
            ]
        }
    ));
});

app.listen(8080, function() {
    console.log("Express server is running on port 8080");
})

//console.log('hello');