## README

This is a rails appliation for uploading and deleting a file on Amazon S3, using jQuery-File-Upload, paperclip and slick carousel with foundation zurb as front-end framework.

* ### Ruby version ###
	* ruby 2.1.2p95
	* Rails 4.1.5

* ### System dependencies ###
	
	**Gems Required**
	* [gem 'foundation-rails'](https://github.com/zurb/foundation-rails)
	* [gem 'aws-sdk'](https://rubygems.org/gems/aws-sdk)
	* [gem 'figaro'](https://github.com/laserlemon/figaro)
	* [gem 'paperclip'](https://github.com/thoughtbot/paperclip)
	* [gem 'jquery-slick-rails'](https://github.com/bodrovis/jquery-slick-rails)
	* [gem 'jquery-fileupload-rails', '~> 0.4.1'](https://github.com/tors/jquery-fileupload-rails)

* ### Configuration ###
	
	You should setup your amazon s3 account, and create a bucket. This code does not create a bucket for you.
	Bucket CORS Configuration should be 
	
	```
		<?xml version="1.0" encoding="UTF-8"?>
		<CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
		    <CORSRule>
		        <AllowedOrigin>*</AllowedOrigin>
		        <AllowedMethod>GET</AllowedMethod>
		        <AllowedMethod>PUT</AllowedMethod>
		        <AllowedMethod>POST</AllowedMethod>
		        <MaxAgeSeconds>3000</MaxAgeSeconds>
		        <AllowedHeader>*</AllowedHeader>
		    </CORSRule>
		</CORSConfiguration>
	```
	
	The code uses aws s3 root __access_key_id__ and __screte_access_key__, tried using IAM __access_key_id__ and __screte_access_key__ but was access denied on post request. 

* ### Deployment instructions ###
	1. Clone the repository.
	2. `$ rake db:migrate`
	3. `$ figaro install`
	
	This will generate `config/application.yml` and add it to `.gitignore`.
	Add following to your `application.yml` file. 
	
	```
		development: 
		  AWS_ACCESS_KEY_ID: __your_key_here__
		  AWS_BUCKET: __your_bucket_name_here__
		  AWS_SECRET_ACCESS_KEY: __your_secret_access_key_here___
		  AWS_REGION: __your_region_here___
		production: 
		  AWS_ACCESS_KEY_ID: __your_key_here__
		  AWS_BUCKET: __your_bucket_name_here__
		  AWS_SECRET_ACCESS_KEY: __your_secret_access_key_here___
		  AWS_REGION: __your_region_here___
		test: 
		  AWS_ACCESS_KEY_ID: __your_key_here__
		  AWS_BUCKET: __your_bucket_name_here__
		  AWS_SECRET_ACCESS_KEY: __your_secret_access_key_here___
		  AWS_REGION: __your_region_here___
	```
	
	4. `$ rails s`

	Thats it! You should have a working rails app which remotely uplaods multiple styles to s3. 

* ### TODO ###
	1. Make the application look pretty.
	2. Error propagation to view with flash notice. 
	3. Code Cleanup.
	4. Testing on all the mobile, desktop browsers. 
	5. Write tests.
	
* ### Notice ###
	
	This is tested on desktop browsers 
	1. Chrome Version 38.0.2125.104
	2. Safari Version 7.0.6

* ### Contributions ###

	Contributions are welcome. 

* ### Licence ###

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
