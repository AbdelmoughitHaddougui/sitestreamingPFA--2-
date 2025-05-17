import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';

const WatchHistory = () => {
    const [watchHistory, setWatchHistory] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchWatchHistory = async () => {
            try {
                const response = await axios.get('/api/users/current/watch-history');
                setWatchHistory(response.data);
                setLoading(false);
            } catch (error) {
                console.error('Error fetching watch history:', error);
                setLoading(false);
            }
        };

        fetchWatchHistory();
    }, []);

    if (loading) {
        return <div>Loading...</div>;
    }

    return (
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
            <h1 className="text-2xl font-bold mb-6">Watch History</h1>
            {watchHistory.length === 0 ? (
                <p className="text-gray-500">No watch history yet.</p>
            ) : (
                <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                    {watchHistory.map((item) => (
                        <div key={item.id} className="bg-white rounded-lg shadow-lg overflow-hidden">
                            <Link to={`/movies/${item.movie.id}`}>
                                <img
                                    src={item.movie.posterUrl}
                                    alt={item.movie.title}
                                    className="w-full h-48 object-cover"
                                />
                            </Link>
                            <div className="p-4">
                                <Link to={`/movies/${item.movie.id}`} className="block">
                                    <h2 className="text-lg font-semibold text-gray-900 hover:text-indigo-600">
                                        {item.movie.title}
                                    </h2>
                                </Link>
                                <p className="text-sm text-gray-500">
                                    Watched on {new Date(item.watchedAt).toLocaleDateString()}
                                </p>
                                <div className="mt-2">
                                    <div className="w-full bg-gray-200 rounded-full h-2">
                                        <div
                                            className="bg-indigo-600 h-2 rounded-full"
                                            style={{
                                                width: `${(item.watchDuration / item.movie.duration) * 100}%`
                                            }}
                                        ></div>
                                    </div>
                                    <p className="text-xs text-gray-500 mt-1">
                                        {Math.round((item.watchDuration / item.movie.duration) * 100)}% completed
                                    </p>
                                </div>
                            </div>
                        </div>
                    ))}
                </div>
            )}
        </div>
    );
};

export default WatchHistory; 