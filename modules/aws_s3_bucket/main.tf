resource "aws_s3_bucket" "example" {
  tags = {
    Name        = var.bucket_name
    Environment = var.env
  }
}


resource "aws_s3_bucket_policy" "policy_attachment" {
  bucket = aws_s3_bucket.example.id
  policy = data.aws_iam_policy_document.bucket_policy.json

}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["593793035673"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.example.arn,
      "${aws_s3_bucket.example.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.example.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.example.id
  key    = "ganesh.jpeg"
  source = "${path.module}/ganesh.jpeg"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  content_type = "text/html"
  acl          = "public-read"
  etag         = filemd5("${path.module}/ganesh.jpeg")
}
