Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-west-1.amazonaws.com'
Paperclip::Attachment.default_options[:s3_credentials] = {
  bucket: Figaro.env.s3_bucket_name,
  access_key_id: Figaro.env.aws_access_key_id,
  secret_access_key: Figaro.env.aws_secret_access_key
 }