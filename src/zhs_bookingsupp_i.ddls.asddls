@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BookingSupply interface entity'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #BASIC
define view entity ZHS_BOOKINGSUPP_I
  as select from zhs_booking_supp
  association     to parent ZHS_BOOKING_I as _Booking on $projection.ParentUuid = _Booking.BookingUuid
  association [1] to ZHS_TRAVEL_I         as _Travel  on $projection.TravelUuid = _Travel.TravelUuid
{
  key booksuppl_uuid        as BooksupplUuid,
      //booking_uuid          as BookingUuid,
      root_uuid             as TravelUuid,
      parent_uuid           as ParentUuid,
      //travel_id             as TravelId,
      //booking_id            as BookingId,
      booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at       as LastChangedAt,

      //Association
      _Booking,
      _Travel
}
