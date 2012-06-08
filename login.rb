#coding: utf-8
require 'selenium-webdriver'
require 'test/unit'


class Login < Test::Unit::TestCase
 

	def setup
		@profile = Selenium::WebDriver::Firefox::Profile.new
		@profile['browser.cache.disk.enable'] = false
		@driver = Selenium::WebDriver.for :firefox, :profile => @profile
        @driver.manage.timeouts.implicit_wait = 30
		@wait = Selenium::WebDriver::Wait.new :timeout => 10		
    end
 	
	def teardown
		@driver.quit
	end
 
	def test_login
		@driver.get 'http://www.kupikupon.ru/'
		@driver.find_element(:link, 'Войти').click
		@driver.find_element(:css, '#new_user input#user_email').send_keys 'testkkupon@gmail.com'
		b = @driver.find_element(:id, 'user_password')
		b.send_keys '123456'
		b.submit
		c = @driver.find_element(:css, '.email')
		d = @driver.find_element(:css, 'div.content>p')

  
		assert c.text.eql?('testkkupon@gmail.com')
		assert d.displayed? 
		assert d.text.eql?('Добро пожаловать!')
		end 
	end 
