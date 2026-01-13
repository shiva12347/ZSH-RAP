@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking interface entity'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #BASIC
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZHS_BOOKING_I
  as select from zhs_booking_db
    composition [0..*] of ZHS_BOOKINGSUPP_I as _BookingSupplement
    association to parent ZHS_TRAVEL_I as _Tarvel on $projection.ParentUuid = _Tarvel.TravelUuid
{

  key booking_uuid    as BookingUuid,
      parent_uuid     as ParentUuid,
      travel_id       as TravelId,
      booking_id      as BookingId,
      booking_date    as BookingDate,
      customer_id     as CustomerId,
      carrier_id      as CarrierId,
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      flight_price    as FlightPrice,
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at as LastChangedAt,
      
         _Tarvel,  // Make association public
         _BookingSupplement

}
