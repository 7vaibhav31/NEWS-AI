@extends('layouts.main')

@section('title')
    AI News Logs
@endsection

@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6"><h1 class="m-0">AI News — Generation Logs</h1></div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ route('ai-news.index') }}">AI News</a></li>
                        <li class="breadcrumb-item active">Logs</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Title</th>
                                <th>Provider</th>
                                <th>Source</th>
                                <th>Status</th>
                                <th>Message</th>
                                <th>When</th>
                                <th>News</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($logs as $log)
                                <tr>
                                    <td>{{ $log->id }}</td>
                                    <td>{{ \Illuminate\Support\Str::limit($log->title, 60) }}</td>
                                    <td>{{ ucfirst($log->provider) }}</td>
                                    <td>{{ $log->source_mode }}</td>
                                    <td>
                                        @if ($log->status == 'success')
                                            <span class="badge badge-success">success</span>
                                        @elseif ($log->status == 'failed')
                                            <span class="badge badge-danger">failed</span>
                                        @else
                                            <span class="badge badge-secondary">skipped</span>
                                        @endif
                                    </td>
                                    <td>{{ \Illuminate\Support\Str::limit($log->message, 80) }}</td>
                                    <td>{{ $log->created_at?->diffForHumans() }}</td>
                                    <td>
                                        @if ($log->news_id)
                                            <a href="{{ url('news') }}" class="btn btn-xs btn-default">#{{ $log->news_id }}</a>
                                        @else
                                            —
                                        @endif
                                    </td>
                                </tr>
                            @empty
                                <tr><td colspan="8" class="text-center text-muted py-4">No runs yet.</td></tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
                <div class="card-footer">{{ $logs->links() }}</div>
            </div>
        </div>
    </section>
@endsection
