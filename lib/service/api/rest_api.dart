// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:otm_template/models/base_response.dart';
// ignore: depend_on_referenced_packages
import 'package:retrofit/retrofit.dart';

part 'rest_api.g.dart';

@RestApi()
abstract class RestAPI {
  factory RestAPI(Dio dio) = _RestAPI;
  // Auth
  // @GET(API.bank)
  // Future<BaseResponse> getBank();
  // AddressBook
  @GET(API.addressBook)
  Future<BaseResponse> getAddressBook(@Queries() Map<String, dynamic> queries);
  @GET("${API.addressBook}/{id}")
  Future<BaseResponse> getAddressBookDetail(@Path() id);
  @POST(API.addressBook)
  Future<BaseResponse> addAddressBook(@Body() Map<String, dynamic> body);
  @PATCH("${API.addressBook}/{id}")
  Future<BaseResponse> updateAddressBook(
      @Path() id, @Body() Map<String, dynamic> body);
  @DELETE("${API.addressBook}/{id}")
  Future<BaseResponse> deleteAddressBook(@Path() id);

  // authenticate
  @GET(API.profile)
  Future<BaseResponse> getProfile();

  @GET(API.province)
  Future<BaseResponse> getProvince(@Queries() Map<String, dynamic> queries);

  @GET(API.district)
  Future<BaseResponse> getDistrict(@Queries() Map<String, dynamic> queries);

  @GET(API.ward)
  Future<BaseResponse> getWard(@Queries() Map<String, dynamic> queries);
  @GET(API.commissionUser)
  Future<BaseResponse> getCommissionUserById(@Path() id);
  @GET(API.walletHistory)
  Future<BaseResponse> getWalletHistory(
      @Queries() Map<String, dynamic> queries);

  //wallet
  @GET(API.walletRequest)
  Future<BaseResponse> getWalletRequest(
      @Queries() Map<String, dynamic> queries);

  //user
  @GET(API.searchUser)
  Future<BaseResponse> searchUser(@Queries() Map<String, dynamic> queries);

  @POST(API.createWalletRequest)
  Future<BaseResponse> createWalletRequest(@Body() Map<String, dynamic> body);

  @GET(API.getAllUser)
  Future<BaseResponse> getAllUser();
  @GET(API.product)
  Future<BaseResponse> getProduct(@Queries() Map<String, dynamic> queries);
  @GET("${API.product}-group/select")
  Future<BaseResponse> getProductGroupSelect();
  @GET(API.favourite)
  Future<BaseResponse> getFavourite(@Queries() Map<String, dynamic> queries);
  @POST(API.favourite)
  Future<BaseResponse> sendFavourite(@Body() Map<String, dynamic> body);

  @GET(API.getAllBank)
  Future<BaseResponse> getAllBank();

  @POST(API.createWithdrawRequest)
  Future<BaseResponse> createWithdrawRequest(@Body() Map<String, dynamic> body);

  @POST(API.changePassword)
  Future<BaseResponse> changePassword(
    @Path() id,
    @Body() Map<String, dynamic> body,
  );

  @PATCH(API.editUserProfile)
  Future<BaseResponse> editUserProfile(@Body() Map<String, dynamic> body);

  @GET(API.order)
  Future<BaseResponse> getOrder(@Queries() Map<String, dynamic> queries);
  @GET("${API.order}/{id}")
  Future<BaseResponse> getOrderDetail(@Path() id);

  @GET(API.referredUser)
  Future<BaseResponse> getReferredUser(
      @Path() id, @Queries() Map<String, dynamic> queryParam);

  @GET(API.cart)
  Future<BaseResponse> getCart();

  @POST(API.cart)
  Future<BaseResponse> addCart(@Body() Map<String, dynamic> body);

  @DELETE(API.commissionUser)
  Future<BaseResponse> deleteUser(@Path() id);

  @GET(API.common)
  Future<BaseResponse> getCommonData();

  @GET(API.notifications)
  Future<BaseResponse> getNotifications(@Queries() Map<String, dynamic> queries);

  @PATCH("${API.notifications}/{id}/seen")
  Future<BaseResponse> seenNotification(@Path() id);

  @GET(API.voucher)
  Future<BaseResponse> getVoucher(@Queries() Map<String, dynamic> queries);

  @GET("${API.notifications}/unread")
  Future<BaseResponse> getNotSeenNotification();

  @GET(API.news)
  Future<BaseResponse> getNews(@Queries() Map<String, dynamic> queries);

  @GET("${API.news}/{id}")
  Future<BaseResponse> getNewsDetail(@Path() id);

  @POST(API.forgotPassword)
  Future<BaseResponse> forgotPassword(@Body() Map<String, dynamic> body);

  @POST(API.resetPassword)
  Future<BaseResponse> resetPassword(@Body() Map<String, dynamic> body);

  @POST(API.shipmentCost)
  Future<BaseResponse> getShipmentCost(@Body() Map<String, dynamic> body);

  @GET(API.globalConfig)
  Future<BaseResponse> getGlobalConfig(@Queries() Map<String, dynamic> queries);

  @GET("${API.editUserProfile}/{id}/order-histories")
  Future<BaseResponse> getOrderHistories(@Path() id ,@Queries() Map<String, dynamic> queries);
  
  @POST("${API.discountSetting}/check")
  Future<BaseResponse> checkDiscountSetting(@Body() Map<String, dynamic> body);

  @GET("${API.getAllBank}/vnpay")
  Future<BaseResponse> getVnpayBank();

  @POST(API.order)
  Future<BaseResponse> submitOrder(@Body() Map<String, dynamic> body);

  @GET("${API.editUserProfile}/summary-info")
  Future<BaseResponse> getSummaryInfo();

  @POST(API.login)
  Future<BaseResponse> login(@Body() Map<String, dynamic> body);

  @GET("${API.delivery}/select")
  Future<BaseResponse> getDeliveryUnit();

  @GET("${API.notifications}/{id}")
  Future<BaseResponse> getNotificationDetail(@Path() id);

  @GET("${API.payment_gateway}/select")
  Future<BaseResponse> getPaymentGateway();

  @GET("${API.product}/{id}")
  Future<BaseResponse> getProductDetail(@Path() id);

  @GET("${API.product}-brand")
  Future<BaseResponse> getProductBrand();

  @GET("${API.product}-brand/{id}")
  Future<BaseResponse> getProductBrandDetail(@Path() id);

  @GET("${API.product}-brand/select")
  Future<BaseResponse> getProductBrandSelect(@Queries() Map<String, dynamic> queries);

  @GET("${API.voucher}/{id}")
  Future<BaseResponse> getVoucherDetail(@Path() id);

  @GET("${API.voucher}/select")
  Future<BaseResponse> getVoucherSelect(@Queries() Map<String, dynamic> queries);

  @POST("${API.voucher}/check/v2")
  Future<BaseResponse> checkVoucher(@Body() Map<String, dynamic> body);

  @POST(API.upload_avatar)
  Future<BaseResponse> uploadAvatar(@Body() FormData body);

  @POST(API.register)
  Future<BaseResponse> register(@Body() Map<String, dynamic> body);

  @GET("address/${API.addressBook}")
  Future<BaseResponse> getAddressBookList();

  @GET("${API.dashboard}/summary")
  Future<BaseResponse> getDashboardSummary(@Queries() Map<String, dynamic> queries);

}

class API {
  // static const String bank = "/getBank";
  static const String addressBook = "/address-book";
  static const String profile = "/authenticate/profile";
  static const String province = "/address/province";
  static const String district = "/address/district";
  static const String ward = "/address/ward";
  static const String commissionUser = "/user/{id}";
  static const String walletHistory = "/wallet-histories";
  static const String walletRequest = "/wallet-request";
  static const String searchUser = "/user/users";
  static const String createWalletRequest = "/wallet-request";
  static const String getAllUser = "/user/users";
  static const String product = "/product";
  static const String favourite = "/product/favourite";
  static const String getAllBank = "/bank";
  static const String createWithdrawRequest = "/withdraw-order";
  static const String changePassword = "/authenticate/change-password/{id}";
  static const String editUserProfile = "/user";
  static const String order = "/order";
  static const String referredUser = "/user/{id}/collaborators";
  static const String cart = "/cart";
  static const String common = "/common"; 
  static const String notifications = "/notifications";
  static const String voucher = "/voucher";
  static const String news = "/news";
  static const String forgotPassword = "/authenticate/forgot-password";
  static const String resetPassword = "/authenticate/reset-password";
  static const String shipmentCost = "/n-and-h/shipment-cost";
  static const String globalConfig = "/global-config";
  static const String discountSetting = "/discount-setting";
  static const String login = "/authenticate/login";
  static const String delivery = "/delivery-unit";
  static const String payment_gateway = "/payment-gateway";
  static const String upload_avatar = "/upload-avatar";
  static const String register = "/authenticate/register";
  static const String dashboard = "/dashboard";

}
