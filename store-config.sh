#!/usr/bin/env bash
cd /shared/httpd/$STORENAME/htdocs/
echo "Running admin configs..."
# Set information configs store
./bin/magento setup:install &&
./bin/magento setup:install db-host=mysql &&
./bin/magento setup:install db-name="$DBNAME" &&
./bin/magento setup:install db-user="$DBUSER" &&
./bin/magento setup:install db-password="$DBPSWD" &&
./bin/magento setup:install admin-firstname=Suporte &&
./bin/magento setup:install admin-lastname=Bis2bis &&
./bin/magento setup:install admin-email=suporte@bis2bis.com.br &&
./bin/magento setup:install admin-user=admin &&
./bin/magento setup:install admin-password=admin &&
./bin/magento setup:install backend-frontname=admin

echo "Running bistwobis configs..."
./bin/magento config:set admin/dashboard/enable_charts 1 &&
./bin/magento config:set admin/security/lockout_failures '0' &&
./bin/magento config:set admin/security/lockout_threshold '' &&
./bin/magento config:set admin/security/password_is_forced 0 &&
./bin/magento config:set admin/security/password_lifetime '' &&
./bin/magento config:set admin/security/session_lifetime 31536000 &&
./bin/magento config:set admin/security/use_form_key 0 &&
./bin/magento config:set cataloginventory/options/show_out_of_stock 1
./bin/magento config:set customer/password/required_character_classes_number 2 &&
./bin/magento config:set dev/image/default_adapter IMAGEMAGICK &&
./bin/magento config:set general/country/allow BR &&
./bin/magento config:set general/country/default BR &&
./bin/magento config:set general/country/destinations BR &&
./bin/magento config:set general/country/optional_zip_countries BR &&
./bin/magento config:set general/locale/code pt_BR &&
./bin/magento config:set general/locale/timezone America/Sao_Paulo &&
./bin/magento config:set general/locale/weight_unit kgs &&
./bin/magento config:set general/region/display_all 1 &&
./bin/magento config:set general/region/state_required BR &&
./bin/magento config:set general/single_store_mode/enabled 1 &&
./bin/magento config:set general/store_information/country_id BR &&
./bin/magento config:set general/store_information/region_id 499 &&
./bin/magento config:set general/store_information/name 'Bis2bis E-commerce' &&
./bin/magento config:set general/store_information/phone '43 3326-1500' &&
./bin/magento config:set general/store_information/postcode '86050-435' &&
./bin/magento config:set general/store_information/city 'Londrina' &&
./bin/magento config:set general/store_information/street_line1 'Bento Munhoz da Rocha Neto' &&
./bin/magento config:set general/store_information/merchant_vat_number '10.738.352/0001-00' &&
./bin/magento config:set oauth/access_token_lifetime/customer '' &&
./bin/magento config:set oauth/access_token_lifetime/admin '' &&
./bin/magento config:set oauth/consumer/expiration_period 31536000 &&
./bin/magento config:set sales_email/general/async_sending 1 &&
./bin/magento config:set shipping/origin/country_id BR &&
./bin/magento config:set shipping/origin/region_id 499 &&
./bin/magento config:set shipping/origin/postcode 86050-435 &&
./bin/magento config:set shipping/origin/city Londrina &&
./bin/magento config:set shipping/origin/street_line1 'Rua Bento Munhoz da Rocha Neto' &&
./bin/magento config:set system/backup/functionality_enabled 1 &&
./bin/magento config:set system/currency/installed BRL &&
./bin/magento config:set system/upload_configuration/jpeg_quality 90 &&
./bin/magento config:set system/upload_configuration/max_height 1080 &&
./bin/magento config:set web/seo/use_rewrites 1 &&
./bin/magento config:set web/secure/use_in_frontend 1 &&
./bin/magento config:set web/secure/use_in_adminhtml 1

./bin/magento setup:store-config:set --base-url="http://$STORENAME.loc/"
./bin/magento setup:store-config:set --base-url-secure="https://$STORENAME.loc/"
./bin/magento setup:upgrade
./bin/magento setup:di:compile