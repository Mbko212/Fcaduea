@extends('layouts.back-end.app')
@section('title','Item Requests List')
@push('css_or_js')
    <!-- Custom styles for this page -->
    <link href="{{asset('public/assets/back-end')}}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
@endpush

@section('content')
<div class="content container-fluid">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{trans('messages.Dashboard')}}</a></li>
            <li class="breadcrumb-item" aria-current="page">{{trans('messages.item_request')}}</li>
        </ol>
    </nav>
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-2">
        <h1 class="h3 mb-0 text-black-50">{{trans('messages.item_request')}} {{trans('messages.List')}}</h1>
    </div>

    <div class="row" style="margin-top: 20px">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h5>{{trans('messages.item_request')}} {{trans('messages.table')}}</h5>
                </div>
                <div class="card-body" style="padding: 0">
                    <div class="table-responsive">
                        <table id="datatable"
                               class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                               style="width: 100%">
                            <thead class="thead-light">
                            <tr>
                                <th>{{trans('messages.SL#')}}</th>
                                <th>{{trans('messages.Name')}}</th>
                                <th>{{trans('messages.Email')}}</th>
                                <th>{{trans('messages.product')}}</th>
                                <th>{{trans('messages.description')}}</th>
{{--                                <th>{{trans('messages.action')}}</th>--}}
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($item_requests as $key => $item_request)
                                <tr>
                                    <td>{{$key+1}}</td>
                                    <td>{{$item_request->first_name}} {{$item_request->last_name}}</td>
                                    <td>{{$item_request->email}}</td>
                                    <td>
                                        @if($item_request->product)
                                            <a href="{{route('admin.product.view',[$item_request->product->id])}}">{!! $item_request->product->name !!}</a>
                                        @endif
                                    </td>
                                    <td>{{$item_request->description}}</td>
{{--                                    <td>--}}
{{--                                        <div class="dropdown">--}}
{{--                                            <button class="btn btn-outline-secondary dropdown-toggle" type="button"--}}
{{--                                                    id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"--}}
{{--                                                    aria-expanded="false">--}}
{{--                                                <i class="tio-settings"></i>--}}
{{--                                            </button>--}}
{{--                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">--}}
{{--                                                <a class="dropdown-item" style="cursor: pointer;"--}}
{{--                                                href="{{route('admin.contact.view',$item_request->id)}}"> {{ trans('messages.View')}}</a>--}}
{{--                                                <a class="dropdown-item delete" style="cursor: pointer;"--}}
{{--                                                id="{{$item_request['id']}}">  {{ trans('messages.Delete')}}</a>--}}
{{--                                            </div>--}}
{{--                                        </div>--}}
{{--                                    </td>--}}
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer">
                    {{$item_requests->links()}}
                </div>
            </div>
        </div>
    </div>

</div>
@endsection

@push('script')
    <!-- Page level plugins -->
    <script src="{{asset('public/assets/back-end')}}/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="{{asset('public/assets/back-end')}}/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <!-- Page level custom scripts -->
    <script>
        $(document).ready(function() {
            $('#dataTable').DataTable();
        });
        $(document).on('click', '.delete', function () {
            var id = $(this).attr("id");
            Swal.fire({
                title: 'Are you sure delete this ?',
                text: "You won't be able to revert this!",
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "{{route('admin.contact.delete')}}",
                        method: 'POST',
                        data: {id: id},
                        success: function () {
                            toastr.success('Contact deleted successfully');
                            location.reload();
                        }
                    });
                }
            })
        });
    </script>
@endpush
