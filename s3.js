var express = require('express'),
    aws = require('aws-sdk'),
    bodyParser = require('body-parser'),
    multer = require('multer'),
    multerS3 = require('multer-s3');

aws.config.update({
    region: 'us-east-1'
});

var app = express(),
    s3 = new aws.S3({ endpoint: 'http://localhost:4566', s3ForcePathStyle: true });

app.use(bodyParser.json());

var upload = multer({
    storage: multerS3({
        s3: s3,
        bucket: 'mybucket',
        key: function (req, file, cb) {
            console.log(file);
            cb(null, file.originalname);
        }
    })
});

app.post('/upload', upload.array('upload',1), function (req, res, next) {
    res.send("Uploaded!");
});

app.listen(3000, function () {
    console.log('Example app listening on port 3000!');
});